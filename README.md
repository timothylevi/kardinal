# kardinal
<small>by Timothy Levi Campbell</small>

[![Code Climate](https://codeclimate.com/github/timothylevi/kardinal.png)](https://codeclimate.com/github/timothylevi/kardinal)

*kardinal makes creating, signing, and sharing petitions easier.*
[Live Site](http://kardinal.timothylevi.com)

A petition site built on Ruby on Rails as a clone of Change.org. Integrates with several APIs as well as two custom built web-scrapers in Ruby to fetch photos of legislators, and to get their descriptions from Wikipedia.org and persist them to the database.

## Features
### App Helptips and Demo Account
At full-screen, help-tips appear for users not logged in and for the demo account. [Open the app](http://kardinal.timothylevi.com) at full-screen to experience the help-tips.

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

## Todo
* Finish formatting forms and buttons to be consistent with updated layout.
* Add JS to flash messages to allow users to remove them without having to refresh the page.
* Update responsiveness of updated views to look good on all screen sizes.
* Finish updating help-tips; make sure they are on ALL pages (missing: Users/new, Sessions/new, Petitions/edit, Victories/index)
* One or two spots where queries are not optimized.
* Separate help-tips into Backbone Views for better organization.
* Refactor code smells (CommentsController#create, RecipientsController#create, SessionsController#create)

## Contact

Submit pull requests for fixes in code, or e-mail me at tlc9406 [at] gmail.com