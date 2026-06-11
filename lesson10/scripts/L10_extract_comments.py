import pathlib
import syside
import csv

# Path to our SysML model file
LESSON_DIR = pathlib.Path(__file__).parent.parent
MODEL_FILE_NAME = "L10_AnnotatedWorkshop"
MODEL_FILE_PATH = LESSON_DIR / "models" / (MODEL_FILE_NAME + ".sysml")
CSV_FILE_PATH = LESSON_DIR / "exports" / (MODEL_FILE_NAME + ".csv")

#Helper Functions
def get_element_name(element) -> str:
    if element is None:
        return ""
    for attribute_name in ("qualified_name", "declared_name", "name"):
        value = getattr(element, attribute_name, None)
        if value:
            return str(value)
    return str(element)

def collect_comments(model: syside.Model) -> list[dict]:
    """
    Extract comments from all parts in the model.
    """
    collected_comments = []

    for comment in model.nodes(syside.Comment):
        comment_name = (
            getattr(comment, "declared_name", None)
            or getattr(comment, "name", None)
            or ""
        )

        locale = getattr(comment, "locale", None) or ""
        body = getattr(comment, "body", None) or ""

        owner = getattr(comment, "owner", None)
        owner_name = get_element_name(owner)

        about=getattr(comment, "about", None) or []
        about_names = [get_element_name(element) for element in about]

        collected_comments.append (
            {
                "comment_name": comment_name,
                "locale": locale,
                "body": body,
                "owner": owner_name,
                "about": "; ".join(about_names),
            }
        )

    return collected_comments


def print_to_csv(collected_docs: list[dict], output_file: pathlib.Path) -> None:
    """
    Export documentation to CSV file.
    """
    
    output_file.parent.mkdir(parents=True, exist_ok=True)

    fieldnames = ["comment_name", "locale", "body", "owner", "about"]

    with output_file.open("w", encoding="utf_8", newline="") as csv_file:
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(collected_docs)
    
    print(f"Exported {len(collected_docs)} comments to {output_file}")


def main() -> None:
    # Load SysML model and get diagnostics (errors/warnings)
    (model, diagnostics) = syside.load_model([MODEL_FILE_PATH])

    # Make sure the model contains no errors before proceeding
    assert not diagnostics.contains_errors(warnings_as_errors=True)

    docs = collect_comments(model)
    print_to_csv(docs, CSV_FILE_PATH)


if __name__ == "__main__":
    main()
