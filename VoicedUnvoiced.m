function UV = VoicedUnvoiced(STE,ZCR)
    T_STE = 0.02823;
    T_ZCR = 0.45093;

    if(STE > T_STE && ZCR < T_ZCR)
        UV = 1;
    else
        UV = 0;
    end
end
