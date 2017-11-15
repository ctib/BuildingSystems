within BuildingSystems.Buildings.Data.Constructions.Thermal;
record BasePlateMultistoreyEgypt =
    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
  final nLayers=2,
  thickness={0.75,0.015},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.LimeSandStone()})
  "Base plate construction for typical egyptian multistorey building (based on S.Attia, 2012)";
