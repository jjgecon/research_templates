
"""
    save_dataframe_chunks(df::DataFrame, output_dir::String, filename_prefix::String; 
                         chunk_size::Union{Int, Nothing}=100_000, 
                         max_file_size_mb::Union{Float64, Nothing}=nothing,
                         clean_dir::Bool=false,
                         file_ext::String="csv",
                         verbose::Bool=true)

Saves a DataFrame to disk in multiple chunks.

# Arguments
- `df`: DataFrame to save
- `output_dir`: Directory where chunks will be saved
- `filename_prefix`: Prefix for the chunk filenames
- `chunk_size`: Number of rows per chunk (default: 100,000)
- `max_file_size_mb`: Maximum file size in MB (overrides chunk_size if specified)
- `clean_dir`: If true, cleans existing files matching extension in the output directory
- `file_ext`: File extension to use (default: "csv")
- `verbose`: Whether to print status messages (default: true)
"""
function save_dataframe_chunks(df::DataFrame, output_dir::String, filename_prefix::String; 
                             chunk_size::Union{Int, Nothing}=100_000, 
                             max_file_size_mb::Union{Float64, Nothing}=nothing,
                             clean_dir::Bool=false,
                             file_ext::String="csv",
                             verbose::Bool=false)
    
    # Create output directory if it doesn't exist
    mkpath(output_dir)
    
    # Clean the output directory if requested
    if clean_dir
        verbose && println("Cleaning the output directory...")
        for file in readdir(output_dir)
            if endswith(file, ".$file_ext")
                rm(joinpath(output_dir, file))
            end
        end
    end
    
    # Get total number of rows
    total_rows = size(df, 1)
    
    # If using file size limitation, estimate rows per chunk
    if !isnothing(max_file_size_mb)
        # Write a small sample to estimate file size
        sample_size = min(1000, total_rows)
        sample_df = df[1:sample_size, :]
        temp_file = tempname() * ".$file_ext"
        
        if file_ext == "csv"
            CSV.write(temp_file, sample_df)
        elseif file_ext == "parquet"
            write_parquet(temp_file, sample_df)
        else
            error("Unsupported file extension: $file_ext")
        end
        
        # Calculate file size in MB
        sample_file_size_mb = filesize(temp_file) / (1024 * 1024)
        rm(temp_file)
        
        # Estimate rows per chunk based on target file size
        estimated_row_size_mb = sample_file_size_mb / sample_size
        chunk_size = floor(Int, max_file_size_mb / estimated_row_size_mb)
        verbose && println("Using estimated chunk size of $chunk_size rows to achieve ~$(max_file_size_mb)MB per file")
    end
    
    # Calculate number of chunks needed
    num_chunks = ceil(Int, total_rows / chunk_size)
    verbose && println("Total observations: $total_rows, will be split into $num_chunks chunks")
    
    # println("--- saving chunks...")
    # Write data in chunks
    for i in 1:num_chunks
        start_idx = (i-1) * chunk_size + 1
        end_idx = min(i * chunk_size, total_rows)
        
        chunk_df = df[start_idx:end_idx, :]
        
        # Save chunk to file with chunk number in filename
        output_path = joinpath(output_dir, "$(filename_prefix)_chunk_$(i).$(file_ext)")
        
        if file_ext == "csv"
            CSV.write(output_path, chunk_df)
        elseif file_ext == "parquet"
            write_parquet(output_path, chunk_df)
        else
            error("Unsupported file extension: $file_ext")
        end
    end
    
    verbose && println("Successfully saved $num_chunks chunks to $output_dir")
    return nothing
end

"""
"""
function clear_directory(output_dir::String; file_ext::String="all", verbose::Bool=false)
    if verbose
        println("Cleaning the output directory...")
    end
    for file in readdir(output_dir)
        path = joinpath(output_dir, file)
        if file_ext == "all"
            isdir(path) ? rm(path; force=true, recursive=true) : rm(path)
        elseif endswith(file, ".$file_ext")
            rm(path)
        end
    end
    return nothing
end

function my_readdir(path, focus_ext::String="all")
    files = readdir(path)
    if focus_ext == "all"
        return files
    else
        return filter(f -> endswith(f, ".$focus_ext"), files)
    end
    
end