def time_hh_mm_ss(elapsed_time):
    # Convert elapsed time to HH:MM:SS format
    hours, rem = divmod(elapsed_time, 3600)
    minutes, seconds = divmod(rem, 60)
    elapsed_time_formatted = f"{int(hours):02}:{int(minutes):02}:{seconds:05.2f}"

    return elapsed_time_formatted
