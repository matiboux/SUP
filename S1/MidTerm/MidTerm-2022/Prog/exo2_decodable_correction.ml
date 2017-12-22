(* question 1: prefix *)

let rec prefix = function
    [], _ | _, [] -> true
  | e1::l1, e2::l2 -> if e1<>e2 then false else prefix (l1,l2);;

(* question 2: is_prefix *)

let rec is_prefix list listlist =
  match listlist with
    [] -> false
  | l::ll -> prefix (l,list) || is_prefix list ll;;

(* question 3: decodable *)

let decodable list = 
  if list = [] then 
    failwith "decodable: no codes!"
  else
    let rec dec = function
        [] -> true
      | e::l -> not(is_prefix e l) && dec l
    in
    dec list ;;