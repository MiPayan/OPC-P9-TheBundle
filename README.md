# OPC-P9-TheBundle

<b>Project 9: Build a travel app</b>

The application is called "The bundle", which consists of three pages:

<p align="center">
  <img width="185" height="400" src="https://user-images.githubusercontent.com/71004452/134660268-468a335b-b883-4d7b-a23c-0cdab92ab38b.png">
  <img width="185" height="400" src="https://user-images.githubusercontent.com/71004452/134660312-2444893e-d974-4cfb-a27e-8750cc13564b.png">
  <img width="185" height="400" src="https://user-images.githubusercontent.com/71004452/134660329-41d6c11b-be82-45fd-8347-6d49356342be.png">
</p>
<br />
<br />

• Exchange rate: Allows you to acquire the exchange rate between the dollar and the local currency.
To obtain the exchange rate, you must use the fixed.io API, updated every day. It will therefore be necessary to obtain the exchange rate at least once a day to be sure to display the right dollar amount to the users
<br />
<br />
• Translation: translate from French to English.
For this, the Google Translate API will be used.
<br />
<br />

• Weather: Display the weather information for New York and the selected city.
For each city, it is mandatory to display the current conditions using the OpenWeathermap API by specifying the temperature as well as the description of the conditions (cloudy, sunny, etc.).
<br />
<br />

To navigate between pages, we use a tab bar ("tab bar"), each tab corresponding to one of the three pages described above.
During network calls in the application, if an error occurs, it is presented as a pop-up using the UIAlertController class.
<br />
<br />

The project respects the MVC model, the application is responsive (adapts to all screen sizes) and portrait mode. 
<br />
<br />

API = (Application Programming Interface) makes the data or functionality of an existing application available for other applications to use. The client sends a request for information and the server sends a response containing the requested data if possible.
