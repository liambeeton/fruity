# Fruity

You are tasked with writing a mobile application (native iOS or Android) consisting of two screens for displaying data about fruit.

The first screen will display a list of fruit. When the user selects an item of fruit the application should show a second screen containing more information about the fruit, specifically price in pounds and pence and weight in kg.

The application will be required to download a data file (JSON) of fruit hosted on a web server. Units are grams and pence. 

## Install Dependencies

The application uses CocoaPods to manage dependencies.

```sh
$ pod install
```
The application uses the following dependencies -

```
platform :iOS, ‘8.0’

pod ‘Objection’, ‘~> 1.6’

target ‘FruityTests’, :exclusive => true do
  pod ‘OCMock’, ‘~> 3.1’
  pod ‘OCHamcrest’, ‘~> 4.1’
end
```

## Project Workspace

Use the ‘Fruity.xcworkspace’ to open the project and run from the iPhone simulator.