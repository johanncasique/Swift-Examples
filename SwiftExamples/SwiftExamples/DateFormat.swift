//
//  DateFormat.swift
//  SwiftExamples
//
//  Created by Johann Casique on 09/04/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import Foundation


class DateFormate{
    
    
    func sanitizeDateStringFrom(_ dateString: String) -> String? {
        //Lo primero que hacemo es crear el formato que vamos a recibir desde el servicio
        //The first thing we can do is set up our format wich is am instance of DateFormatter
        let dateFormatter = DateFormatter()
        //Luego le decimo el tipo de calendio que vamo a utilizar, podemo mirar la clase Calendar para ver mas en detalle los tipos de calendario que podemos usar
        //Then we chosse the format calendar, we can see more detail in Calendar Class
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
        
        //After we have initial dateFormatter set up, we actually need to create a new one. Think of it as saying "here is what the string I'm passing in is formatted as (our initial DateFormat) and here is what I want to converted(our newFormat)
        let newFormat = DateFormatter()
        //this format will output the first three letter of the month followed by the day (Jun 25)
        newFormat.dateFormat = "MMM dd"
        if let date = dateFormatter.date(from: dateString){
            return newFormat.string(from: date)
        }else{
            return nil
        }
    }
    
    
    func dateFrom(string: String){
    
        //Aqui tenemos otra manera de convertir la fecha al formato que queremos, y es que vamos a hacer un split del string de la fecha y meterlo en un array para luego tratarlas como 2 fechas por separado.
        //Here we have another way to convert the date to the format that we want, we will make a split over date string and put in an array, then trait both as a diferent dates
        //Inicializamos las variables, que mas adelante para  a usar para guardar el resultado final de la fecha.
        //Init the variable the soon we will use to store de newDate format
        var convertedDate: String = ""
        var convertedTime: String = ""
        
        //First we make an instance of DateFormatter to format the date that we receive from service.
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "yyyy-MM-dd"
        //Here we make anothe instance of DateFomatter to make the format tha we will use to display
        let newDateFormat = DateFormatter()
        newDateFormat.dateFormat = "MMM d"
        
        //Make the same before, but this time is for de another part of the string date
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH-mm-ss"
        let newTimeFormat = DateFormatter()
        newTimeFormat.dateFormat = "hh:mm a"
        
        
        let dateTime = "2017–04–02T13:10:00"
        let dateComponent = dateTime.components(separatedBy: "T")
        print(dateComponent)
        
        if let date = dateFormatter1.date(from: "2017-04-12"){
            convertedDate = newDateFormat.string(from: date)
        }
        
        if let time = timeFormatter.date(from: "13:10:00"){
            convertedTime = newTimeFormat.string(from: time)
        }
        
        
    }
    
}
