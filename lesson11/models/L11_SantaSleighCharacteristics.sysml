package L11_SantaSleighCharacteristics {
    private import ScalarValues::*;

    attribute def BoundingBox {
        attribute length : Real default = 0.0;
        attribute width : Real default = 0.0;
        attribute height : Real default = 0.0;
    }

    part def Sleigh {
        attribute boundingBox : BoundingBox;

        attribute emptyMass : Real default = 0.0;
        attribute maximumPayloadMass : Real default = 0.0;
        attribute runnerCount : Integer default = 2;
        attribute maximumSpeed : Real default = 0.0;
        attribute storageVolume : Real default = 0.0;
    }

    part def SantaSleigh specializes Sleigh {
        attribute redefines boundingBox {
            attribute redefines length default = 4.5;
            attribute redefines width default = 1.8;
            attribute redefines height default = 1.6;
        }

        attribute redefines emptyMass default = 250.0;
        attribute redefines maximumPayloadMass default = 10000.0;
        attribute redefines runnerCount default = 2;
        attribute redefines maximumSpeed default = 1200.0;
        attribute redefines storageVolume default = 12.96;
    }
}