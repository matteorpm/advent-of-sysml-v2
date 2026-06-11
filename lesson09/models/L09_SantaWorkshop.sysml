package L09_SantaWorkshop {
        private import ScalarValues::*;
        
        // Install Sysand package for PLEML from Sysand and uncomment line below.
        // private import PLEML::*;
        // pleml dependency could not be resolved from the current Sysand index.
        // Keeping this import commented out so the model remains valid.

        part def SantaWorkshop {
                // Work areas of the workshop
                part assemblyLine {
                        doc
                        /* Where toys are assembled. */
                        part supervisor = headElf;
                }
                part qualityControl {
                        doc
                        /* Quality checking station. */
                }
                part packagingArea {
                        doc
                        /* Gift wrapping and packaging. */
                }

                // Elves working in the workshop
                part headElf : Elf;

                part albert : Elf {
                        attribute redefines skillType := SkillType::assembly;
                        attribute redefines skillLevel := 50.0;
                }
                part betty : Elf {
                        attribute redefines skillType := SkillType::assembly;
                        attribute redefines skillLevel := 100.0;
                }
                part charlie : Elf {
                        attribute redefines skillType := SkillType::quality;
                        attribute redefines skillLevel := 100.0;
                }
                part diana : Elf {
                        attribute redefines skillType := SkillType::quality;
                        attribute redefines skillLevel := 100.0;
                }
                part edward : Elf {
                        attribute redefines skillType := SkillType::packaging;
                        attribute redefines skillLevel := 100.0;
                }
                part fiona : Elf {
                        attribute redefines skillType := SkillType::packaging;
                        attribute redefines skillLevel := 100.0;
                }
                part george : Elf {
                        attribute redefines skillType := SkillType::assembly;
                        attribute redefines skillLevel := 150.0;
                }
                part helen : Elf {
                        attribute redefines skillType := SkillType::quality;
                        attribute redefines skillLevel := 150.0;
                }
        }

        part def Elf {
                attribute skillType : SkillType default := SkillType::TBD;
                attribute skillLevel : Real default := 0.0;
        }

        enum def SkillType {
                enum TBD;
                enum assembly;
                enum quality;
                enum packaging;
        }
}
