package L04_SantaCargoBay_Challenge {
    part def Sleigh {    
        part cargoBay {
            item payload : Bag;
        }
    }

    part def BottomlessGiftBag specializes Bag {
        item gifts [*];
    }
    part def SantaSleigh specializes Sleigh {
       part redefines cargoBay {
            item giftBag redefines payload : BottomlessGiftBag {
                item toytrain subsets gifts;
                item teddyBear subsets gifts;
                item CandyCane subsets gifts;
            }       
        }
    }    
// Extend the model below as follow
    // - Define the bottomless gift bag that can hold any number of gifts (gifts are items).
    // - Model Santa’s sleigh as a special kind of sleigh.
    // - In this sleigh, the cargo bay’s payload should be called a gift bag.
    // - The gift bag should always be a bottomless gift bag.
    // - The gift bag should contain at least a toy train, a teddy bear, and a candy cane.

}
