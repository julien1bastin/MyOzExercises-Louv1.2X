local
   fun {Count E S Acc}
      case S of nil then Acc
      []H|T then
	 if E==H then {Count E T Acc+1}
	 else {Count E T Acc}
	 end
      end
   end
   fun {Counter S}
      case S
      of H|T then [H#{Count H S 0}]|{Counter T}
      end
   end
in
   thread {Browse {Counter a|b|a|c|_}} end
end