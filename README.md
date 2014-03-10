# kardinal
<small>by Timothy Levi Campbell</small>

[![Code Climate](https://codeclimate.com/github/timothylevi/kardinal.png)](https://codeclimate.com/github/timothylevi/kardinal)

*kardinal makes creating, signing, and sharing petitions easier.*
[Live Site](http://kardinal.timothylevi.com)

A petition site built on Ruby on Rails as a clone of Change.org. Integrates with several APIs as well as two custom built web-scrapers in Ruby to fetch photos of legislators, and to get their descriptions from Wikipedia.org and persist them to the database. (Please note that currently the data for the site was primarily generated using the Faker gem, and names and descriptions of most petitions are mostly incomprehensible.)

## Features
### Help-tips and Demo Account
At full-screen, help-tips appear for users not logged in and for the demo account. [Open the app](http://kardinal.timothylevi.com) at full-screen to experience the help-tips.

### Scraper to Retrieve Recipient Descriptions
Iterates through a list of possible Wikipedia page titles for each recipient in the database, and creates a URI to a Wikipedia page using Addressable. Then opens the page and then converts it to a Nokogiri object. Then grabs the first paragraph of the main content using a css selector (``page.css('div#mw-content-text p').first``). Uses a regex to remove footnotes and parenthetical information from the paragraph, and then tries to save it.

See [Recipient::set_descriptions](https://github.com/timothylevi/kardinal/blob/master/app/models/recipient.rb) and associated methods for a fuller understanding of the implementation.

### Uses APIs to Retrieve Information about Legislators
Sets Recipient's image by using Paperclip and [the /unitedstates project](http://theunitedstates.io/)'s images API to get a Recipient's image.

Uses [Sunlight's Congress API](http://sunlightlabs.github.io/congress/) and [congress](http://rubygems.org/gems/congress) gem to get information about each recipient. (Also submitted pull request to update documentation in order to make it easier for future users to use the gem to find all recipients in one go.)

### Create a petition from Recipient's profile
By creating a url with a query string that includes a recipient's id, when a user clicks "Start a petition to...", the recipient's id is sent up as a parameter to the new petition page with the recipient pre-selected.

### Last Viewed Petition
When a petition is visited, the id of that petition is stored in the session in order to display it to users on petition index pages.

    # PetitionsController#show
    def show
      @petition = Petition.includes(:recipients, creator: :contact_details).find(params[:id])

      session[:last_viewed] = @petition.id
      @creator = @petition.creator
      @petition_signature = PetitionSignature.find_single(current_user, @petition) || PetitionSignature.new
      @victory = Victory.find_by_petition_id(@petition.id) || Victory.new
    end
### Omniauth with Facebook
Integrates sign-up and login in with Facebook to create a user profile on the app. Retrieves photo and contact information from Facebook.

### Overwriting Native Methods

    # Cause.rb
    # creates 'pretty' urls
    def to_param
      "#{self.name}"
    end

## Tests
Run `rspec spec` to see [model tests](https://github.com/timothylevi/kardinal/tree/master/spec/models). (Currently working on fixing Rakefile to ease this.)

## Todo
### Currently working on:
* **Update responsiveness of updated views to look good on all screen sizes.**
* Finish formatting forms and buttons to be consistent with updated layout.

### For the future:
* Add JS to flash messages to allow users to remove them without having to refresh the page.
* Finish updating help-tips; make sure they are on ALL pages (missing: Users/new, Sessions/new, Petitions/edit, Victories/index)
* One or two spots where queries are not optimized.
* Separate help-tips into Backbone Views for better organization.
* Refactor code smells (CommentsController#create, RecipientsController#create, SessionsController#create)
* Refactor Recipient::set_images to separate out into a class and instance method
* Write integration tests

## Contact

Submit pull requests for fixes in code, or e-mail me at tlc9406 [at] gmail.com