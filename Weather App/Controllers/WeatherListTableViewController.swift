//
//  WeatherListTableViewController.swift
//  WeatherListTableViewController
//
//  Created by Archit Patel on 2021-09-11.
//

import UIKit

class WeatherListTableViewController : UITableViewController, AddWeatherDelegate {
    
    private var weatherListViewModel = WeahterListViewModel()
    private var lastUnitSelection : Unit! 
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)
        }
        
    }
    
    //MARK: - AddWeatherDelegate Method

    func addWeatherDidSave(vm: WeatherViewModel) {
        
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
        
    }
    
    //MARK: - TabelView Delegate and DataSource Method
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = weatherListViewModel.modelAt(indexPath.row)
        
        cell.configure(weatherVM)
        
        return cell
         
    }
    
    //MARK: - PrepareForSegue Method
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForAddSettingsTableViewController(segue: segue)

        }
    }
    
    func prepareSegueForAddSettingsTableViewController(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError()
        }
        
        guard let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError()
        }
        settingsTVC.delegate = self
    }
    

    func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError()
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError()
        }
        
        addWeatherCityVC.delegate = self
    }
}

extension WeatherListTableViewController : SettingsDelegate {
    
    func settingsDone(vm: SettingsViewModel) {
        
        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue {
            weatherListViewModel.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)
        }
        
    }
}
