within BuildingSystems.Climate.WeatherDataMeteonorm;
record WeatherDataFile_Egypt_Hurguada =
    BuildingSystems.Climate.WeatherData.WeatherDataFile (
  info="Source: Meteonorm 7.1",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/WeatherDataNetcdf/Egypt_Hurguada_weather.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.1</html>"));
