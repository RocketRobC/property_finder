# PropiFind

Propifind was born to help manage the decision making process associated with buying a property.

As my wife and I spent many Saturdays driving around the suburbs with the kids in the car looking at properties, we found ourselves loosing focus on the house criteria we set. It was all to easy to get caught up in one exciting feature and forget about the key important features we needed for day to day life. 

PropiFind aims to keep you accountable and not loose sight of the important things you're really looking for.



## How does it work?

PropiFind has three main components, a list of properties, a list of weighted criteria and user ratings. 

Here's how to use it. 

### Criteria

The core value of PropiFind stems from a list of criteria that you're looking for in a property. Once you've worked out what your criteria is you need to decide how important each item is by giving each a value between 0 and 100, where 100 would be must have can't do without and 1 being really no that important at all. This list can be configured on the criteria page under the 'Configuration' nav menu.

### Properties

Once you've found a property you're interested in, visit the 'Properties' page and enter its details using the 'Add Property' form. A property has some predefined attributes however you can also add specific feature that you'd like to record for a property as well. From the 'Configuration' nav menu select 'Features' and give your new feature a name and description. They will appear at the bottom of the new property form. 

### Ratings

After visiting the property, select the property from the properties list page and then click the yellow 'Rate' button in the top left panel. This will open up a modal where you can rate each criteria out of 10.  Saving your ratings returns to the property page. 



## Data

Once ratings have been provided by one or more users some new data will appear on the property page. 

*WIP*



## Setup

How to run tests:

```
% bundle exec rake
```

How to run the development console:

```
% bundle exec hanami console
```

How to run the development server:

```
% bundle exec hanami server
```

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% bundle exec hanami db prepare

% HANAMI_ENV=test bundle exec hanami db prepare
```

Explore Hanami [guides](http://hanamirb.org/guides/), [API docs](http://docs.hanamirb.org/1.3.1/), or jump in [chat](http://chat.hanamirb.org) for help. Enjoy! 🌸
