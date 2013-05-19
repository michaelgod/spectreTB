function [t_trunc s_trunc fs] = time_interploate(time,start, stop, signal, pts)
    Ts = (stop-start)/(pts-1)
    fs = 1/Ts
    t1 = find(time >= start);
    t2 = find(time >= stop);
    t1 = t1(1);
    t2 = t2(1);
    % t_trunc = time(t1:t2);
    t_trunc = start:(stop-start)/(pts-1):stop;
    s_trunc = signal(t1:t2);    
    s_trunc = resple(s_trunc, pts);
end