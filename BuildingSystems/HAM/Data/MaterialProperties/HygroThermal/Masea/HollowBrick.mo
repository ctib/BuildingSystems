within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record HollowBrick =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=6,
    name="Perforrated hollow brick (Hochlochziegel)",
    rho=765.0,
    c=850.0,
    sorTabX={0.0,0.8,1.0},
    sorTabY={0.0,0.012,0.193},
    myTabX={0.0,1.0},
    myTabY={15.0,15.0},
    lambdaTabX={0.0,280.0},
    lambdaTabY={0.18,1.933},
    dwwTabX={0.0,12.0,193.0},
    dwwTabY={0.0,3.5e-10,3.5e-6},
    dwsTabX={0.0,12.0,193.0},
    dwsTabY={0.0,3.5e-10,3.4e-6},
    lambdaDry=0.18,
    w80=-999,
    w95=-999,
    wF=188.0,
    porosity=0.28,
    A=9.6,
    myDry=15.0,
    myMoistF=-999,
    moistSup=-999) "Perforrated hollow brick (Hochlochziegel)"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
