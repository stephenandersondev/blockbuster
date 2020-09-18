$LOAD_PATH.unshift '.'
require 'config/environment'

use CustomerController
use MovieController
use RentalController
run ApplicationController
