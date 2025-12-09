"""Functions used in preparing Guido's gorgeous lasagna."""

EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2

def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.
    """
    return EXPECTED_BAKE_TIME - elapsed_bake_time


def preparation_time_in_minutes(number_of_layers):
    """Calcuate the preparation time in minutes for given number of layers
    :param number_of_layers:int - number of layers you want to add to the lasagna
    return: int - how many minutes you would spend making layers
    """
    return number_of_layers * PREPARATION_TIME

def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """Calculate the total minutes you have been in the kitchen cooking.
    
     :param number_of_layers: int - the number of layers added to the lasagna
     :param elapsed_bake_time: int - the number of minutes the lasagna has spent baking in the oven already
     :return :int - the total minutes you have been in the kitchen cooking — your preparation time layering + the time the lasagna has spent baking in the oven
    """
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
