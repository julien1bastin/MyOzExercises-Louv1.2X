local
   fun {Prod A B}
      if A==B+1 then nil
      else A|{Prod A+1 B}
      end
   end
   fun {Sieve Xr}
      local
	 fun{Filter Xs K}
	    case Xs of X|Xr then
	       if X mod K \= 0 then X|{Filter Xr K}
	       else {Filter Xr K}
	       end
	    else nil
	    end
	 end
      in
	 case Xr
	 of nil then nil
	 []X|Xr then X|{Sieve thread {Filter Xr X} end}
	 end
      end
   end
   fun {NotPrime S1 S2}
      case S1
      of nil then nil
      []H|T then
	 if S2 == nil then H|{NotPrime T nil}
	 elseif H==S2.1 then {NotPrime T S2.2}
	 else H|{NotPrime T S2}
	 end
      end
   end
   S1
   S2
in
   thread S1={Prod 2 10} end
   thread S2={Sieve S1} end
   thread {Browse {NotPrime S1 S2}} end
end