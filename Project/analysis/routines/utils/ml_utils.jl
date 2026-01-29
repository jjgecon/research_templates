
function calculate_f_score(y_true, y_pred)
    tp = sum((y_true .== 1) .& (y_pred .== 1))
    tn = sum((y_true .== 0) .& (y_pred .== 0))
    fp = sum((y_true .== 0) .& (y_pred .== 1))
    fn = sum((y_true .== 1) .& (y_pred .== 0))
    
    precision = tp / (tp + fp)
    recall = tp / (tp + fn)
    accuracy = (tp + tn) / (tp + tn + fp + fn)

    f_score = 2 * (precision * recall) / (precision + recall)
    return f_score, precision, recall, accuracy
end

function validation_stats(true_values, predicted_values)
    """
    Calculate validation statistics between true and predicted values.
    
    Parameters:
    - true_values: Vector of true values.
    - predicted_values: Vector of predicted values.
    
    Returns:
    - A dictionary with the mean absolute error (MAE) and root mean square error (RMSE).
    """
    mae = mean(abs.(true_values .- predicted_values))
    mse = mean((true_values .- predicted_values).^2)
    f_score, precision, recall, accuracy = calculate_f_score(true_values, predicted_values)

    return Dict("MAE" => mae, "MSE" => mse, "F1-Score" => f_score, "Precision" => precision, "Recall" => recall, "Accuracy" => accuracy)

end