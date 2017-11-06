within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record LimePlaster =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=8,
    name="Gypsum-lime plaster (Kalkputz)",
    rho=1600.0,
    c=850,
    sorTabX={0.0,0.5,0.8,0.9,0.93,0.99,1.0},
    sorTabY={0.0,20.0,30.0,50.0,70.0,180.0,250.0},
    myTabX={0.0,1.0},
    myTabY={7.0,7.0},
    lambdaTabX={0.0,300.0},
    lambdaTabY={0.7,1.933},
    dwwTabX={0.0,10,250.0},
    dwwTabY={0.0,1.5e-10,0.1e-7},
    dwsTabX={0.0,10,250.0},
    dwsTabY={0.0,1.5e-10,1.5e-7},
    lambdaDry=0.7,
    w80=-999,
    w95=-999,
    wF=250.0,
    porosity=0.30,
    A=3.0,
    myDry=7.0,
    myMoistF=-999,
    moistSup=-999) "Gypsum-lime plaster (Kalkputz)"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
