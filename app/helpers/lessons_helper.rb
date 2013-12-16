module LessonsHelper

    def k(d, pl, kl)
	#function k($d,$pl, $kl){ return $d."-".$pl."-".$kl; }  -->
	d.to_s + '-' + pl + '-' + kl 
    end
end
