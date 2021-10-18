//
//  WeatherViewController.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 07/05/2021.
//
//  swiftlint:disable identifier_name
//  swiftlint:disable line_length
//  swiftlint:disable empty_enum_arguments

import UIKit

final class WeatherViewController: UIViewController {
    @IBOutlet private weak var mainCityLabel: UILabel!
    @IBOutlet private weak var mainTemperatureLabel: UILabel!
    @IBOutlet private weak var mainDescriptionLabel: UILabel!
    @IBOutlet private weak var mainTemperatureMinimumMaximumLabel: UILabel!
    @IBOutlet private weak var secondCityLabel: UILabel!
    @IBOutlet private weak var secondTemperatureLabel: UILabel!
    @IBOutlet private weak var secondDescriptionLabel: UILabel!
    @IBOutlet private weak var secondTemperatureMinimumMaximumLabel: UILabel!
    private let weatherService = WeatherService()

    override func viewDidLoad() {
        super.viewDidLoad()
        didTapRefreshButton()
    }
}

private extension WeatherViewController {

    //    to get the weather using the network call
    func getWeatherWithId(city id: Int) {
        weatherService.getWeather(city: id) { [weak self] result in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    //    need to improve this condition
                    if weather.name == "Agen" {
                        guard let weatherDescription = weather.weather.first?.description else { return }
                        self.mainDescriptionLabel.text = weatherDescription.description.capitalized
                        self.mainCityLabel.text = "\(weather.name)"
                        self.mainTemperatureLabel.text = self.celsius(weather.main.temp)
                        self.mainTemperatureMinimumMaximumLabel.text = " Max. " + self.celsius(weather.main.tempMax) + " Min. " + self.celsius(weather.main.tempMin)
                    } else {
                        guard let weatherDescription = weather.weather.first?.description else { return }
                        self.secondDescriptionLabel.text = weatherDescription.description.capitalized
                        self.secondCityLabel.text = "\(weather.name)"
                        self.secondTemperatureLabel.text = self.celsius(weather.main.temp)
                        self.secondTemperatureMinimumMaximumLabel.text = " Max. " + self.celsius(weather.main.tempMax) + " Min. " + self.celsius(weather.main.tempMin)
                    }
                case .failure(_):
                    self.alertPopUp()
                }
            }
        }
    }

    //    re-launches the network call
    @IBAction func didTapRefreshButton() {
        getWeatherWithId(city: 3038634)
        getWeatherWithId(city: 5128581)
    }

    //    to convert the temperature to degrees Celsius using a formula.
    func celsius(_ temperature: Double) -> String {
        let kelvin = temperature
        let absolutZero = 273.15
        let expression = (kelvin - absolutZero).toTruncatedString()
        return " " + String(expression) + "°"
    }
}
