//
//  WeatherListTableViewController.swift
//  WeatherListTableViewController
//
//  Created by Archit Patel on 2021-09-11.
//

import UIKit

class WeatherListTableViewController : UITableViewController, AddWeatherDelegate {
    
    private var weatherListViewModel = WeahterListViewModel()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
//        let resource = Resource<WeatherResponse>(url: URL(string: "api.openweathermap.org/data/2.5/weather?q=Montreal&appid=0466f7cc4f43dae0a50b81979402eaa9&units=imperial")!) { data in
//            
//            return try? JSONDecoder().decode(WeatherResponse.self, from: data)
//        }
//        
//        WebService().load(resource: resource) { weatherResponse in
//            
//            if let weatherResponse = weatherResponse {
//                print(weatherResponse)
//            }
//        }
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
            
        }
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
