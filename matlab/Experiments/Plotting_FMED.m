%for plotting averages over all runs for each MED!

kends = 200; % this is where the plot stops
n_runs = m; % We'll average over all runs!
n_plots = size(DATA,2); % One plot for each MED

colors = [':', 'g', 'b', 'm', 'r', 'c', 'k'];

figure;
hold on; % Combine all plots

for j = 1:n_plots % For each MED
    % legend_labels{j} = ['MED',num2str(j), ': [', num2str(MED{j}(1)), ', ', num2str(MED{j}(2)), ', ', num2str(MED{j}(3)), ', ', num2str(MED{j}(4)), ']'];
    legend_labels{j} = sprintf('MED%d [%2.1f, %2.1f, %2.1f, %2.1f]', j, MED{j}(1), MED{j}(2), MED{j}(3), MED{j}(4));
    % Compute average for all runs
    freq_total = zeros(k, 1);
    
    for l = 1:n_runs % For each run
        freq = squeeze(squeeze(DATA{j}(1,5,:,l))); %% Why is squeeze needed?
       
        % If final observed value is <50%, invert all values (y = 100% - y)
        if (freq(kends) < 0.50)
            freq = ones(k,1) - freq;
        end
    
        freq_total = freq_total + freq;
    end
    
    freq_avg = freq_total / n_runs;
    
    x = 1:1:k;
    
    plot(x, freq_avg, colors(j), 'LineWidth', 2);

end

title(['Average Net Frequency of Eventually Dominant Strains With Different Medicines']);
axis([0 kends 0 1.0]);        
xlabel('days');
ylabel('frequency');
legend(legend_labels,'Location','southeast');
grid on;
hold off;

