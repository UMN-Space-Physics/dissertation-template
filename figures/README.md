# Figures Directory

Place your figures in this directory, then include them with:

```latex
\begin{figure}[!htbp]
    \centering
    \includegraphics[width=\textwidth]{figures/my_figure.pdf}
    \caption[
        %Short caption for the list of figures
        A  figure.
    ]{
        % Full caption shown below the image
        A detailed view of the figure. As you can see, it is very good!
    }
    % A label so you can do \ref{my_fig} or \cref{my_fig}
    \label{my_fig}
\end{figure}
```

PDF figures are best, since they remain sharp when zoomed. 
