(* GCD with lists *)
(*  question 1: product  *)

let rec product = function
    [] -> 1
  | e::l -> e * product l;;

(*  question 2: decompose  *)

let decompose u =
  if u <= 1 then 
    invalid_arg "decompose: parameter <= 1"
  else
    let rec decomp_rec q u =
      if u = 1 then
        []
      else 
	if u mod q = 0 then
          q :: decomp_rec q (u/q)
	else
          decomp_rec (q+1) u
    in
      decomp_rec 2 u ;;

(*  question 3: shared *)

let rec shared list1 list2 =
  match (list1, list2) with
    | ([],_) -> []
    | (_,[]) -> []
    | (e1::l1, e2::l2) -> 
                if e1 < e2 then 
            	   shared l1 (e2::l2)
                else 
                   if e2 < e1 then 
            	       shared (e1::l1) l2
                   else                        (* e1=e2 *)
            	       e1::shared l1 l2 ;;

(* question 4: gcd *)

let gcd u v =
  product (shared (decompose u) (decompose v)) ;;