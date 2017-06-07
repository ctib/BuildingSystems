within BuildingSystems.Fluid.Examples.FlowSystem;
model Simplified4 "Removed valve dynamics"
  extends Simplified3(
    valNorth(each use_inputFilter=false),
    valSouth(each use_inputFilter=false),
    pmpNorth(
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      use_inputFilter=false),
    pmpSouth(
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      use_inputFilter=false),
    valSouth1(each use_inputFilter=false),
    valSouth2(each use_inputFilter=false),
    valNorth1(each use_inputFilter=false),
    valNorth2(each use_inputFilter=false),
    pumpHea(use_inputFilter=false),
    pumpCoo(use_inputFilter=false),
    valCoo(use_inputFilter=false),
    valHea(use_inputFilter=false));
  annotation (Documentation(info="<html>
<p>
The model is further simplified by removing the valve and pump control dynamics.
</p>
</html>", revisions="<html>
<ul>
<li>
December 14, 2016, by Michael Wetter:<br/>
Added missing <code>each</code> keywords.
</li>
<li>
October 7, 2016, by Filip Jorissen:<br/>
First implementation.
</li>
</ul>
</html>"),
experiment(Tolerance=1e-6, StopTime=1000),
__Dymola_Commands(file=
          "Resources/Scripts/Dymola/Fluid/Examples/FlowSystem/Simplified4.mos"
        "Simulate and plot"));
end Simplified4;
