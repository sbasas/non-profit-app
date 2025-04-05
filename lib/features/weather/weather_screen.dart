import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // TODO: Implement refresh weather data
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
            _buildCurrentWeather(context),
            const SizedBox(height: 24),
            _buildHourlyForecast(context),
            const SizedBox(height: 24),
            _buildDailyForecast(context),
            const SizedBox(height: 24),
            _buildWeatherAlerts(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentWeather(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'San Francisco, CA',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Updated 10 minutes ago',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Text(
                  '72°F',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildWeatherDetail(
                  context,
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '65%',
                ),
                _buildWeatherDetail(
                  context,
                  icon: Icons.air,
                  label: 'Wind',
                  value: '5 mph',
                ),
                _buildWeatherDetail(
                  context,
                  icon: Icons.visibility,
                  label: 'Visibility',
                  value: '10 mi',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDetail(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Icon(icon, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildHourlyForecast(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hourly Forecast',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 24,
            itemBuilder: (context, index) {
              return _buildHourlyForecastItem(
                context,
                hour: '${index}:00',
                temperature: '${65 + (index % 10)}°F',
                icon: Icons.wb_sunny,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHourlyForecastItem(
    BuildContext context, {
    required String hour,
    required String temperature,
    required IconData icon,
  }) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(hour),
          const SizedBox(height: 8),
          Icon(icon),
          const SizedBox(height: 8),
          Text(temperature),
        ],
      ),
    );
  }

  Widget _buildDailyForecast(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '7-Day Forecast',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return _buildDailyForecastItem(
              context,
              day: _getDayName(index),
              highTemp: '${70 + (index % 10)}°F',
              lowTemp: '${55 + (index % 10)}°F',
              icon: Icons.wb_sunny,
            );
          },
        ),
      ],
    );
  }

  String _getDayName(int index) {
    final days = [
      'Today',
      'Tomorrow',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return days[index];
  }

  Widget _buildDailyForecastItem(
    BuildContext context, {
    required String day,
    required String highTemp,
    required String lowTemp,
    required IconData icon,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(day),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(highTemp),
          const SizedBox(width: 8),
          Text(
            lowTemp,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherAlerts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Weather Alerts',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Card(
          color: Colors.orange.shade100,
          child: ListTile(
            leading: const Icon(Icons.warning, color: Colors.orange),
            title: const Text('High UV Index'),
            subtitle: const Text('Wear sunscreen and protective clothing'),
          ),
        ),
      ],
    );
  }
} 