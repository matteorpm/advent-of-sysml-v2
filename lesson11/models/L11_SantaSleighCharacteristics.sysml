package L11_SantaSleighCharacteristics {
    private import ScalarValues::*;

    attribute def BoundingBox {
        attribute length : Real default := 0.0;
        attribute width : Real default := 0.0;
        attribute height : Real default := 0.0;
    }

    part def Sleigh {
        attribute boundingBox : BoundingBox;
        attribute emptymass : Real default := 0.0;
        attribute maximumPayloadMass : Real default := 0.0;
        attribute runnerCount : Integer default := 2;
        attribute maximumSpeed : Real default := 0.0;
    }
}