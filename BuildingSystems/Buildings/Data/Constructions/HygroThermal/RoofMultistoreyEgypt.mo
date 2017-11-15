within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record RoofMultistoreyEgypt =
    BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction
    (
  final nLayers=3,
  thickness={0.01,0.24,0.01},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.LimePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Concrete(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.LimePlaster()})
  "Roof construction for typical egyptian multistorey building  (based on S.Attia, 2012)";
