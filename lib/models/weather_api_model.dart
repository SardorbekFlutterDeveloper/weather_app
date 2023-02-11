
import 'dart:convert';

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
    WeatherModel({
        required this.lat,
        required this.lon,
        required this.elevation,
        required this.timezone,
        required this.units,
        required this.current,
        required this.hourly,
        required this.daily,
    });

    String lat;
    String lon;
    int elevation;
    String timezone;
    String units;
    Current current;
    Hourly hourly;
    Daily daily;

    factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        lat: json["lat"],
        lon: json["lon"],
        elevation: json["elevation"],
        timezone: json["timezone"],
        units: json["units"],
        current: Current.fromJson(json["current"]),
        hourly: Hourly.fromJson(json["hourly"]),
        daily: Daily.fromJson(json["daily"]),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "elevation": elevation,
        "timezone": timezone,
        "units": units,
        "current": current.toJson(),
        "hourly": hourly.toJson(),
        "daily": daily.toJson(),
    };
}

class Current {
    Current({
        required this.icon,
        required this.iconNum,
        required this.summary,
        required this.temperature,
        required this.wind,
        required this.precipitation,
        required this.cloudCover,
    });

    Icon icon;
    int iconNum;
    Summary summary;
    double temperature;
    Wind wind;
    Precipitation precipitation;
    int cloudCover;

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        icon: iconValues.map[json["icon"]]!,
        iconNum: json["icon_num"],
        summary: summaryValues.map[json["summary"]]!,
        temperature: json["temperature"]?.toDouble(),
        wind: Wind.fromJson(json["wind"]),
        precipitation: Precipitation.fromJson(json["precipitation"]),
        cloudCover: json["cloud_cover"],
    );

    Map<String, dynamic> toJson() => {
        "icon": iconValues.reverse[icon],
        "icon_num": iconNum,
        "summary": summaryValues.reverse[summary],
        "temperature": temperature,
        "wind": wind.toJson(),
        "precipitation": precipitation.toJson(),
        "cloud_cover": cloudCover,
    };
}

enum Icon { OVERCAST, PARTLY_SUNNY, MOSTLY_CLOUDY, CLOUDY, FOG }

final iconValues = EnumValues({
    "cloudy": Icon.CLOUDY,
    "fog": Icon.FOG,
    "mostly_cloudy": Icon.MOSTLY_CLOUDY,
    "overcast": Icon.OVERCAST,
    "partly_sunny": Icon.PARTLY_SUNNY
});

class Precipitation {
    Precipitation({
        required this.total,
        required this.type,
    });

    double total;
    Type type;

    factory Precipitation.fromJson(Map<String, dynamic> json) => Precipitation(
        total: json["total"]?.toDouble(),
        type: typeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "type": typeValues.reverse[type],
    };
}

enum Type { NONE, RAIN }

final typeValues = EnumValues({
    "none": Type.NONE,
    "rain": Type.RAIN
});

enum Summary { OVERCAST, MOSTLY_CLOUDY, CLOUDY, FOG }

final summaryValues = EnumValues({
    "Cloudy": Summary.CLOUDY,
    "Fog": Summary.FOG,
    "Mostly cloudy": Summary.MOSTLY_CLOUDY,
    "Overcast": Summary.OVERCAST
});

class Wind {
    Wind({
        required this.speed,
        required this.angle,
        required this.dir,
    });

    double speed;
    int angle;
    String dir;

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        angle: json["angle"],
        dir: json["dir"],
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "angle": angle,
        "dir": dir,
    };
}

class Daily {
    Daily({
        required this.data,
    });

    List<DailyDatum> data;

    factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        data: List<DailyDatum>.from(json["data"].map((x) => DailyDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DailyDatum {
    DailyDatum({
        required this.day,
        required this.weather,
        required this.icon,
        required this.summary,
        required this.allDay,
        this.morning,
        this.afternoon,
        this.evening,
    });

    DateTime day;
    Icon weather;
    int icon;
    String summary;
    AllDayElement allDay;
    dynamic morning;
    dynamic afternoon;
    dynamic evening;

    factory DailyDatum.fromJson(Map<String, dynamic> json) => DailyDatum(
        day: DateTime.parse(json["day"]),
        weather: iconValues.map[json["weather"]]!,
        icon: json["icon"],
        summary: json["summary"],
        allDay: AllDayElement.fromJson(json["all_day"]),
        morning: json["morning"],
        afternoon: json["afternoon"],
        evening: json["evening"],
    );

    Map<String, dynamic> toJson() => {
        "day": "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
        "weather": iconValues.reverse[weather],
        "icon": icon,
        "summary": summary,
        "all_day": allDay.toJson(),
        "morning": morning,
        "afternoon": afternoon,
        "evening": evening,
    };
}

class AllDayElement {
    AllDayElement({
        required this.weather,
        required this.icon,
        required this.temperature,
        this.temperatureMin,
        this.temperatureMax,
        required this.wind,
        required this.cloudCover,
        required this.precipitation,
        this.date,
        this.summary,
    });

    Icon weather;
    int icon;
    double temperature;
    double? temperatureMin;
    double? temperatureMax;
    Wind wind;
    CloudCover cloudCover;
    Precipitation precipitation;
    DateTime? date;
    Summary? summary;

    factory AllDayElement.fromJson(Map<String, dynamic> json) => AllDayElement(
        weather: iconValues.map[json["weather"]]!,
        icon: json["icon"],
        temperature: json["temperature"]?.toDouble(),
        temperatureMin: json["temperature_min"]?.toDouble(),
        temperatureMax: json["temperature_max"]?.toDouble(),
        wind: Wind.fromJson(json["wind"]),
        cloudCover: CloudCover.fromJson(json["cloud_cover"]),
        precipitation: Precipitation.fromJson(json["precipitation"]),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        summary: summaryValues.map[json["summary"]]!,
    );

    Map<String, dynamic> toJson() => {
        "weather": iconValues.reverse[weather],
        "icon": icon,
        "temperature": temperature,
        "temperature_min": temperatureMin,
        "temperature_max": temperatureMax,
        "wind": wind.toJson(),
        "cloud_cover": cloudCover.toJson(),
        "precipitation": precipitation.toJson(),
        "date": date?.toIso8601String(),
        "summary": summaryValues.reverse[summary],
    };
}

class CloudCover {
    CloudCover({
        required this.total,
    });

    int total;

    factory CloudCover.fromJson(Map<String, dynamic> json) => CloudCover(
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
    };
}

class Hourly {
    Hourly({
        required this.data,
    });

    List<AllDayElement> data;

    factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        data: List<AllDayElement>.from(json["data"].map((x) => AllDayElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
