within BuildingSystems.Buildings.BuildingTemplates;
model Building1Zone0DDistrict
  "Low-order building model for district simulation"
  extends BuildingSystems.Buildings.BuildingTemplates.Building1Zone0D(
    final VAir = 0.8*length*width*heightSto*nSto,
    final AAmb = ARoo+AFac,
    final AGro = length*width,
    final AInn = 2.0 * length * width * (nSto-1) // area of interior ceilings
      + (2.0 * integer(width/4.0+0.5) * length + 2.0 * integer(length/4.0+0.5) * width) * nSto, // area of interior walls
    final UValAmb = (ARoo*UValRoo+AFac*UValFac)/(ARoo+AFac),
    UValGro = 1.0,
    UValInn = 1.0,
    final CAmb = if conAmb == BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Low then 25000.0 * AAmb
      else if conAmb == BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Medium then 65000.0 * AAmb
      else 105000.0 * AAmb,
    final CGro = if conGro == BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Low then 25000.0 * AGro
      else if conGro == BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Medium then 65000.0 * AGro
      else 105000.0 * AGro,
    final CInn = if conInn == BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Low then 25000.0 * AInn
      else if conInn == BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Medium then 65000.0 * AInn
      else 105000.0 * AInn,
    final nWindows = 4,
    final height = heightSto*nSto,
    AWin = {fWin*length*heightSto*nSto,fWin*width*heightSto*nSto,fWin*length*heightSto*nSto,fWin*width*heightSto*nSto},
    UValWin = {2.0,2.0,2.0,2.0});
  parameter Modelica.SIunits.Length length = 10.0
    "Length of the building";
  parameter Modelica.SIunits.Length width = 10.0
    "Width of the building";
  final parameter Modelica.SIunits.Area ARoo = length * width
    "Roof area of the building";
  final parameter Modelica.SIunits.Area AFac = (2*length+2*width)*heightSto*nSto-sum(AWin)
    "Opaque facade area of the building";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer UValFac = 1.0
    "Mean heat loss coefficient of the opaque building facade"
    annotation (Evaluate=true, Dialog(tab="Constructions", group="Ambient constructions"));
  parameter Modelica.SIunits.CoefficientOfHeatTransfer UValRoo = 1.0
    "Mean heat loss coefficient of the building roof"
    annotation (Evaluate=true, Dialog(tab="Constructions", group="Roof constructions"));
  parameter BuildingSystems.Buildings.Types.ThermalBuildingCapacity conAmb = BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Medium
    "Thermal capacity outside construction"
    annotation (Evaluate=true, Dialog(tab="Constructions", group="Thermal building capacity"));
  parameter BuildingSystems.Buildings.Types.ThermalBuildingCapacity conGro = BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Medium
    "Thermal capacity building plate construction"
    annotation (Evaluate=true, Dialog(tab="Constructions", group="Thermal building capacity"));
  parameter BuildingSystems.Buildings.Types.ThermalBuildingCapacity conInn = BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Medium
    "Thermal capacity inner building construction"
    annotation (Evaluate=true, Dialog(tab="Constructions", group="Thermal building capacity"));
  parameter Modelica.SIunits.Length heightSto = 3.0
    "Height of one storey";
  parameter Integer nSto = 2
    "Number of storeys";
  final parameter Modelica.SIunits.Area AFloorSpace = width*length*nSto
    "Floor space area of the building";
  parameter Real fWin = 0.3
    "Window percentage of the facades";
  final parameter Real AV = (AAmb+length*width+sum(AWin))/(length*width*heightSto*nSto)
    "Ratio area to volume";

  annotation(defaultComponentName="building",
Documentation(info="<html>
<p>
This is a low-order building model for district simulation.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Building1Zone0DDistrict;
