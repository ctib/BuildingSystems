within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record BasePlateMultistoreyEgypt =
    BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction
    (
  final nLayers=2,
  thickness={0.75,0.015},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Concrete(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.LimeSandStone()})
  "Base plate construction for typical egyptian multistorey building (based on S.Attia, 2012)";
