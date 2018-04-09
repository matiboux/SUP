(* q1: int_of_bigint *)

let rec int_of_bigint = function
    [] -> 0
  | e::l -> e + 10 * int_of_bigint l ;;


(* q2: bigint_of_int *)

let bigint_of_int n =
  if n < 0 then
    invalid_arg "longInt_of_int: not a natural"
  else
    let rec tolist n =
      if n = 0 then 
        [] 
      else
        (n mod 10) :: tolist (n / 10)
    in
      tolist n ;;


(* q2: bigint_sum *)

(* first version *)
   (* plus_one: add 1 to a longint  *)

let plus_one = function 
    [] -> [1]
  | e::l -> (e+1)::l ;;

let rec bigint_sum big1 big2 =
  match (big1, big2) with
      ([], remain) | (remain, []) -> remain
    | (d1::r1, d2::r2) ->
        let s = d1 + d2 in
          if s < 10 then 
            s :: bigint_sum r1 r2
          else 
            (s - 10) :: bigint_sum (plus_one r1) r2 ;;

(* second version *)

let bigint_sum big1 big2 =
  let rec add = function
      ([], r) | (r, []) -> r
    | (d1::r1, d2::r2) ->
        let s = d1 + d2 in
          if s < 10 then 
            s :: add(r1, r2)
          else 
            (s - 10) :: add (add([1], r1), r2)
  in
    add (big1, big2) ;; 

(* q3: bigint_mult *)

let bigint_mult big n = 
  if n < 0 then
    invalid_arg "bigint_mult: negative multiplier"
  else
    let rec mult n = function
        ([], 0) -> []
      | ([], carry) -> bigint_of_int carry
      | (d::r, carry) -> let res = n * d + carry in
			 (res mod 10) :: mult n (r, res/10)
    in
    match n with
	0 -> []
      | 1 -> big
      | n -> mult n (big, 0) ;;

(* q4: bigint_times *)

let bigint_times big1 big2 = 
  let rec mult = function
      ([], _) | (_, []) -> []
    | (0::r, big) | (big, 0::r) -> 0::mult (r, big)
    | (1::[], big) | (big, 1::[]) -> big
    | (1::r, big) | (big, 1::r) -> bigint_sum big (0::mult (r, big))
    | (d::r, big) -> bigint_sum (bigint_mult big d) (0::mult (r, big))
  in 
    mult (big1, big2) ;;