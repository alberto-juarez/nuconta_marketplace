# NuConta Marketplace

## App screenshots
| <img src="/assets/screenshot1.png" height="400" /> | <img src="/assets/screenshot2.png" height="400" /> |

## App icon
<img src="/assets/app_logo.png" height="150" />

## Get the demo working
- Open VS Code
- Use ```ctrl+shift+p``` or ```cmd+shift+p```
- Type clone
- Select ```Git:clone```
- Enter this url [```https://github.com/alberto-juarez/nuconta_marketplace.git```](https://github.com/alberto-juarez/nuconta_marketplace.git)
- Select the destination folder
- Click the ```Get packages``` button and leave the rest to the dart extension
- Enter your API key at the ``` /lib/services/api.dart ``` file at line 11 (I didn't knew how to secure it while uploading it)
- Run the simulator(s) as normal

Testing:
- **To run the integrations tests that I made for the app run:**
    ``` flutter drive --target=test_driver/app.dart  ```
- You can also run some other test located on the ```test``` folder using VS code.

## Demo video

You can find a quick runthrough of the app on:
[https://drive.google.com/file/d/1LUJUYtB1uxKRS-8qtPKvL-pQsSo9fpmg/view?usp=sharing](https://drive.google.com/file/d/1LUJUYtB1uxKRS-8qtPKvL-pQsSo9fpmg/view?usp=sharing)

## About

Prior to the realization of this project I had no knowledge of Flutter as I am used to doing native iOS development, I found Flutter to be quite a good tool to use and will continue to learn about it in the future.

The balance updates itself when the "Home" screen is loaded due to the fact that it calls the Query on the GraphQL Flutter library and the object that it retrieves is still one million (it doesnt updates on the server side), but on the product page you can see that when the balance is returned it is updated on that specific time.

### Widget hierarchy

- myApp( ) -> Wrapper of the GraphQLProvider so that the queries can be made inside the app.
    - MainView( ) -> The mai
        - AppHeader( ) -> Contains the logo and the text on top of the MainView
        - MainData (customer ) -> Has the customer name and iterates through the offers
            - ProductCard (offer) -> Single card for an offer with a link to its details
            - MoneyView (balance) -> Displays the available balance of the customer
    - ProductDetail (offer,balance) -> Displays the details of a product and provides the ability to purchase the offer, can be accessed when clicking on a product on the MainView
        - MoneyView (balance) -> Displays the available balance of the customer



### Libraries

- **graphql_flutter:** Client to make requests to the GraphQL endpoint provided.

- **flutter_launcher_icons**: Made it easy to generate the app logos for both iOS and Android. 

- **intl**: Helps convert a number to a currency format (used for the balance)


### Organization

Inside the lib folder I made 3 other folders to organize the different files as following:

- Views: This has the widgets used by the app
- Models: Ths has the different type of objects that can be created (all of them are used on the GraphQL request to parse)
- Services: Contains the endpoint url, the token, the query and the mutation needed for this example.

## Credits
- Cart icon taken from [Flaticon]([https://www.flaticon.com/authors/kiranshastry]).

- Nubank logo taken from Google Images.

- Design idea taken from Dribbble.


