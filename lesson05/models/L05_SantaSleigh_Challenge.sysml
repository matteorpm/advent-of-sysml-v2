package L05_SantaSleigh_Challenge {
    private import ScalarValues::*;

    part def SantaSleigh {
        part cockpit;
        // TASK 1:
        // Model the cargo bay's definition such that it can be either an ordinary 
        // cargo bay that may hold one payload that is a bottomless gift bag, or
        // a magical cargo bay that can hold an arbitrary number of ordinary bags.
        // We want to be able to access the payload of the cargo bay rgardless of
        // the configuration.
        part cargoBay : CargoBay;
        part dashboard;

        // TASK 2:
        // Add composite or referential usages to model:
        // - exctly two runners, enumerated as the left runner nd the right runner
        // - Mrs. Claus (Santa has to communicate with her during work)

        // TASK 4:
        // Review the multiplicities int he whole model and specify it whenever the
        // default is not suitable.
        ref item santa;
        abstract ref part reindeer : Reindeer[9];

        ref part dasher  subsets reindeer;
        ref part dancer  subsets reindeer;
        ref part prancer subsets reindeer;
        ref part vixen   subsets reindeer;
        ref part comet   subsets reindeer;
        ref part cupid   subsets reindeer;
        ref part donner  subsets reindeer;
        ref part blitzen subsets reindeer;
        ref part rudolph subsets reindeer;
    }

    part def Reindeer {
        attribute energyLevel : Real;
        constant attribute noseColor;
        // TASK 3:
        // Add attributes to describe the weight and the name of the reindeer
        // (use constant if applicable).
    }

    abstract part def CargoBay
}
