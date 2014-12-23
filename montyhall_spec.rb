require './montyhall'

describe "verifications" do

	describe "revelation de boîte" do  
	  	it { reveal(2,1).to eq(3) }
	  	it { reveal(3,1).to eq(2) }
	  	it { reveal(1,2).to eq(3) }
	  	it { reveal(3,2).to eq(1) }
	  	it { reveal(1,3).to eq(2) }
	  	it { reveal(2,3).to eq(1) }
	 end

	describe "pour la stratégie changement, les 3 boîtes apparaissent (on choisit la 1, on élimine la 2, alors on choisit la 3. Par exemple." do  
	  	it { reveal(2,1).to eq(3) }
	 end


end
