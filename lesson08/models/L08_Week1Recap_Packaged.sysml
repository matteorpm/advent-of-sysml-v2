package L08_Week1Recap_Packaged {
    package SleighDesign {
        private import BaseComponents::*;

        part def SantaSleigh {
            part cockpit {
                doc /* This is where Santa sits. */
                ref item driver = santa;
            }
            part cargoBay : CargoBay;
            part dashboard : NaughtyNiceDashboard;
    
    
        abstract part runners [2];
        part leftrunner [1] subsets runners;
        part rightrunner [1] subsets runners;

        ref item santa;
        ref item mrsClaus;

        abstract ref part reindeer : entities::reindeer [9];

        ref part dasher subsets reindeer [1] {
            constant attribute redefines noseColor := Datatypes::Color::orange;
        }
        ref part dancer subsets reindeer [1] {
            constant attribute redefines noseColor := Datatypes::Color::yellow;
        }
        ref part prancer subsets reindeer [1] {
            constant attribute redefines noseColor := Datatypes::Color::green;
        }
        ref part vixen subsets reindeer [1] {
            constant attribute redefines noseColor := Datatypes::Color::blue;
        }
        ref part comet subsets reindeer [1] {
            constant attribute redefines noseColor := Datatypes::Color::indigo;
        }
        ref part cupid subsets reindeer [1] {
            constant attribute redefines noseColor := Datatypes::Color::violet;
        }
        ref part donner subsets reindeer [1] {
            constant attribute redefines noseColor := Datatypes::Color::silver;
        }
        ref part blitzen subsets reindeer [1] {
            constant attribute redefines noseColor := Datatypes::Color::gold;
        }
        ref part rudolph subsets reindeer [1] {
            constant attribute redefines noseColor := Datatypes::Color::red;
            attribute redefines energyLevel := 200.0;
            }
        }
    }

    package ConfiguredSleigh {
        part def SantaSleigh specializes SleighDesign::SantaSleigh {
            private import MagicalBagVariant::*;
            //private import MagicalCargoVariant::*;

            part redefines cargoBay: CargoBay;
        }
    }

    package WorkshopDesign {
        private import ScalarValues::*;

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

    package entities {
        private import ScalarValues::*;

        part def reindeer {
            attribute energyLevel : Real;
            attribute weight : Real;
            constant attribute name : String;
            constant attribute noseColor : Datatypes::Color;
        }
    }

    package Datatypes {
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

    package BaseComponents {
        part def NaughtyNiceDashboard;

        abstract part def CargoBay {
            item payload [*] : Bag;
        }

        abstract part def Bag {
            item gifts [*];
        }
    }

    package MagicalBagVariant {
        private import BaseComponents::*;

        part def <CargoBay> 'Ordinary Cargo Bay' specializes BaseComponents::CargoBay {
            item redefines payload [0..1] : BottomlessGiftBag;
        }

        item def BottomlessGiftBag specializes Bag {
            item redefines gifts [*];
        }
    }

    package MagicalCargoBayVariant {
        private import BaseComponents::*;

        part def 'Magical Cargo Bay' specializes BaseComponents::CargoBay {
            item redefines payload [*] : OrdinaryBag;
        }

        alias CargoBay for 'Magical Cargo Bay';

        item def OrdinaryBag specializes Bag {
            item redefines gifts [100];
        }
    }
}