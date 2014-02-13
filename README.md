# MissionHub Ruby Gem [![Build Status](https://secure.travis-ci.org/Godmedia/missionhub-gem.png)](http://travis-ci.org/Godmedia/missionhub-gem) [![Dependency Status](https://gemnasium.com/Godmedia/missionhub-gem.png)](https://gemnasium.com/Godmedia/missionhub-gem) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/Godmedia/missionhub-gem)
Consume the MissionHub API easily with this Ruby Gem

## Examples

Create Person

    # visitor
    MissionHub::Person.create(:permissions => 2, :person => {:first_name => "FN", :last_name => "LN", :email => "test2@test.com"})
    # operator
    MissionHub::Person.create(:permissions => 4, :person => {:first_name => "FN", :last_name => "LN", :email => "test2@test.com"})

Create Label

    # test leader label
    #FN LN Test person id 2856753
    leader_id = MissionHub::Label.all.detect{ |l| l.name == "Leader" }.id
    ol = MissionHub::OrganizationalLabel.create :person_id => 2856753, :label_id => leader_id

But when I go to http://www.missionhub.com/profile/2856753 I see no labels assigned still.  Then I tried

    ol = MissionHub::OrganizationalLabel.create "organizational_label" => { :person_id => 2856753, :label_id => leader_id, :added_by_id => 778531 }

Seems you need to include another param parallel to organizational_lable, otherwise rails for some reason just behaves as if you passed the inner attributes hash.  This works:

    ol = MissionHub::OrganizationalLabel.create "a" => "b", "organizational_label" => { :person_id => 2856753, :label_id => leader_id, :added_by_id => 778531 }

## Installation

Add this line to your application's Gemfile:

    gem 'MissionHub'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install MissionHub

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

##License

(The MIT License)

Copyright (c) 2012 Tataihono Nikora, GodMedia

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
