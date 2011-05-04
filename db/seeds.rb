# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
include AMEE::Organisations
Parser.instance.parse {
      aspect("Product") {
        section("Furniture") {
          section 'Home'
          section 'Office'
        }
        section("Tools") {
          section "Spanners"
          section "Screwdrivers"
        }
      }
      aspect("Location") {
        layers "Continent","Country","Region","County"
        continent("Europe") {
          country("England") {
            region("The North-West") {
              county("Cumbria")
            }
            county("Essex")
            #Layers don't actually have to be all specified, this one has no region
          }
        }
      }
    }