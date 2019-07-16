|   |  |
| ------------- | ------------- |
| **Ruby Version**  | 2.6.0    |
| **Rails Version** | 5.2.3    |
| **Database**      | SQLite 3 |
| **Prerequisites** | RVM, nodejs (Javascript Runtime), Bundler |


## Project Setup

  1. Clone this github repo.
  2. Install ruby version 2.6.0. Use command `rvm install 2.6.0`
  3. Change your current working directory to project folder (MapprrAssignment)
  4. run `bundle install` to install gem dependencies (You should be inside MapprrAssignment directory to run this command)
  5. To create database tables run `rake db:migrate` .This creates tables in sqlite development database (stored in db folder)
  6. Once tables have been set up, run `rails server` to run local development server. Now the application should be listening on localhost at port 3000. [http://localhost:3000](http://localhost:3000)
  7. Create few products in database by calling API POST requests via tools like Postman (API docs given below)

#### API Docs

1. Creates / Updates a product

    |   |  |
    | ------------- | ------------- |
    | URL  | `<host>/api/v1/products.json`   |
    | Method | POST   |
    | Headers | Content-Type: application/json |
    | Description | Create/Update a product (SKU ID is unique per product ) |

    Request Body

      ```
       {
        "expire_date": "2019-09-05",
        "name": "Black Jacket",
        "sku_id": 1234,
        "category_list": [
          "jackets",
          "mens-wear"
        ],
        "tag_list": [
          "black",
          "jacket",
          "leather"
        ],
        "images": [
          {
            "img_path": "https://images-na.ssl-images-amazon.com/images/I/41v4Zul3X%2BL._SR100,100_.jpg"
          },
          {
            "img_path": "https://images-na.ssl-images-amazon.com/images/I/310Sl4Q6kZL._SR100,100_.jpg"
          }
        ],
        "price": 1000
    	}

      ```

    Sample POST snippets

    [https://jsoneditoronline.org/?id=5e413559aba549c2b16a75681a70060f](https://jsoneditoronline.org/?id=5e413559aba549c2b16a75681a70060f)

    [https://jsoneditoronline.org/?id=fc69f0f603054bb5bf92a83efc815453](https://jsoneditoronline.org/?id=fc69f0f603054bb5bf92a83efc815453)

    [https://jsoneditoronline.org/?id=2d48076ff9144b5e8088f89154e17f22](https://jsoneditoronline.org/?id=2d48076ff9144b5e8088f89154e17f22)

    [https://jsoneditoronline.org/?id=93efcb24df354589906bd01541ef2a7d](https://jsoneditoronline.org/?id=93efcb24df354589906bd01541ef2a7d)

    Assumptions / Limitations

    * No spaces and special characters allowed in multi word category name, only minus(-) is allowed
    * No spaces and special characters allowed in multi word tag name, only minus(-) is allowed
    * SKU ID is positive integer only
    * No validations applied on expire_date


2. Backoffice listing of products

	  |   |  |
    | ------------- | ------------- |
    | URL  | `<host>/admin/products`   |
    | Method | GET   |
    | Description | Clicking on the link at product name opens a new tab to edit its fields  |

3. Backoffice editing product

	  |   |  |
    | ------------- | ------------- |
    | URL  | `<host>/admin/products/<id>/edit`   |
    | Method | GET   |
    | Description | Except images all fields can be updated on this page  |

    Assumptions / Limitations

      * Multiple categories should be separated by comma(,)
      * Multiple tags should be separated by comma(,)
      * No spaces and special characters allowed in multi word category name, only minus(-) is allowed
      * No spaces and special characters allowed in multi word tag name, only minus(-) is allowed
      * No validations applied on expire_date
