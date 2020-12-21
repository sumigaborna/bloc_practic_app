import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

const String MOCK_OPEN_WEATHER_RESPONSE =
    "{\"coord\":{\"lon\":130,\"lat\":35},\"weather\":[{\"id\":801,\"main\":\"Clouds\",\"description\":\"clear sky\",\"icon\":\"02n\"}],\"base\":\"stations\",\"main\":{\"temp\":280.64,\"feels_like\":276.6,\"temp_min\":280.64,\"temp_max\":280.64,\"pressure\":1027,\"humidity\":56,\"sea_level\":1027,\"grnd_level\":1027},\"visibility\":10000,\"wind\":{\"speed\":2.79,\"deg\":294},\"clouds\":{\"all\":15},\"dt\":1608551898,\"sys\":{\"country\":\"KR\",\"sunrise\":1608503047,\"sunset\":1608538320},\"timezone\":32400,\"id\":1842966,\"name\":\"Gijang\",\"cod\":200}";
