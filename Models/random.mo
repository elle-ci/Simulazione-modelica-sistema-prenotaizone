
model RandomNumberGenerator
      "Generate random numbers with Xorshift1024star"

      parameter Real samplePeriod = 1.0
        "Sample period for the generation of random numbers";

      parameter Integer globalSeed = 30020
        "Global seed to initialize random number generator";

    // Random number generators with exposed state
      parameter Integer localSeed = 614657
        "Local seed to initialize random number generator";

     output Real r1024 "Random number generated with Xorshift1024star";

protected
      discrete Integer state1024[Modelica.Math.Random.Generators.Xorshift1024star.nState];

algorithm
      when initial() then
        // Generate initial state from localSeed and globalSeed

        state1024 := Modelica.Math.Random.Generators.Xorshift1024star.initialState(localSeed, globalSeed);
        r1024     := 0;
	
      elsewhen sample(0,samplePeriod) then
       (r1024,state1024) := Modelica.Math.Random.Generators.Xorshift1024star.random(pre(state1024));
      end when;


end RandomNumberGenerator;



