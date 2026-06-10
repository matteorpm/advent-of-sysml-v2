package L07_Wee1Recap {
    private import ScalarValues::*;

    part def SantaSleigh {
        part cargoBay : CargoBay;
        part dashboard : NaughtyNiceDashboard;
    
    
    abstract part runners [2];
    part leftrunner [1] subsets runners;
    part rightrunner [1] subsets runners;

    ref item santa;
    ref item mrsClaus;

    abstract ref part reindeer : Reindeer [9];

    ref part dasher subsets reindeer [1] {
        constant attribute redefines noseColor := Color::orange;
    }
    ref part dancer subsets reindeer [1];
    ref part prancer subsets reindeer [1];
    ref part vixen subsets reindeer [1];
    ref part comet subsets reindeer [1];
    ref part cupid subsets reindeer [1];
    ref part donner subsets reindeer [1];
    ref part blitzen subsets reindeer [1];
    ref part rudolph subsets reindeer [1] {
        constant attribute redefines noseColor := Color::red;
        attribute redefines energyLevel := 200.0;
        }
    }

    part def SantaWorkshop {
        part assemblyLine {
            doc /* Where toys are assembled. */
            part supervisor = headElf;
        }

        part qualityControl {
            doc /* Quality Checking Station. */
        }

        part packagingArea {
            doc /* Gift Wrapping and Packaging. */
        }

        part headElf : Elf;

        part albert : Elf {
            attribute redefines skillType := SkillType::assembly;
            attribute redefines skillLevel := 50.0;
        }

        part betty : Elf {
            attribute redefines skillType := SkillType::assembly;
            attribute redefines skillLevel := 100.0;
        }
    }

    part def Reindeer {
        attribute energyLevel : Real;
        attribute weight : Real;
        constant attribute name : String;
        constant attribute noseColor : Color;
    }

    abstract part def CargoBay {
        item payload [*] : Bag;
    }

    part def OrdinaryCargoBay specializes CargoBay {
        item redefines payload [0..1] : BottomlessGiftBag;
    }

    part def MagicalCargoBay specializes CargoBay {
        item redefines payload [*] : OrdinaryBag;
    }

    abstract item def Bag {
        item gifts [*];
    }

    item def OrdinaryBag specializes Bag {
        item redefines gifts [100];
    }

    item def BottomlessGiftBag specializes Bag {
        item redefines gifts;
    }
    
    part def NaughtyNiceDashboard;

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

    enum def Color {
        enum orange;
        enum yellow;
        enum green; 
        enum blue; 
        enum indigo;
        enum violet; 
        enum silver; 
        enum gold; 
        enum red; 
    }
}