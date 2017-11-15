within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record OuterWallMultistoreyEgypt =
    BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction
    (
  final nLayers=3,
  thickness={0.005,0.24,0.005},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.LimePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.LimeSandStone(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.LimePlaster()})
  "Outer wall construction for a typical egyptian multistorey building (based on S. Attia, 2012)";
