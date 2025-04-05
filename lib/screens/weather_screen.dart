import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // Mock weather data - in a real app, this would come from a weather API
  final Map<String, dynamic> _weatherData = {
    'temperature': 72,
    'condition': 'Partly Cloudy',
    'humidity': 65,
    'windSpeed': 8,
    'forecast': [
      {'day': 'Today', 'high': 75, 'low': 62, 'condition': 'Partly Cloudy'},
      {'day': 'Tomorrow', 'high': 78, 'low': 64, 'condition': 'Sunny'},
      {'day': 'Wed', 'high': 80, 'low': 66, 'condition': 'Sunny'},
      {'day': 'Thu', 'high': 77, 'low': 63, 'condition': 'Cloudy'},
      {'day': 'Fri', 'high': 74, 'low': 61, 'condition': 'Rain'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // TODO: Implement refresh functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
              // TODO: Implement location selection
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCurrentWeather(),
            const SizedBox(height: 24),
            _buildWeatherDetails(),
            const SizedBox(height: 24),
            _buildForecast(),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentWeather() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Weather',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Organization HQ',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(
                  _getWeatherIcon(_weatherData['condition']),
                  size: 48,
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_weatherData['temperature']}°',
                  style: GoogleFonts.poppins(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _weatherData['condition'],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Feels like ${_weatherData['temperature']}°',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildDetailItem(
          icon: WeatherIcons.humidity,
          label: 'Humidity',
          value: '${_weatherData['humidity']}%',
        ),
        _buildDetailItem(
          icon: WeatherIcons.wind,
          label: 'Wind',
          value: '${_weatherData['windSpeed']} mph',
        ),
      ],
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Colors.blue),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildForecast() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '5-Day Forecast',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _weatherData['forecast'].length,
          itemBuilder: (context, index) {
            final day = _weatherData['forecast'][index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    day['day'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    _getWeatherIcon(day['condition']),
                    color: Colors.blue,
                  ),
                  Text(
                    '${day['high']}° / ${day['low']}°',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return WeatherIcons.day_sunny;
      case 'partly cloudy':
        return WeatherIcons.day_cloudy;
      case 'cloudy':
        return WeatherIcons.cloudy;
      case 'rain':
        return WeatherIcons.rain;
      default:
        return WeatherIcons.day_sunny;
    }
  }
} 