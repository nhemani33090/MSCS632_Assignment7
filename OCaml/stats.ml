let mean lst =
  let sum = List.fold_left (+) 0 lst in
  float_of_int sum /. float_of_int (List.length lst)

let median lst =
  let sorted = List.sort compare lst in
  let len = List.length sorted in
  if len mod 2 = 0 then
    let mid1 = List.nth sorted (len / 2 - 1)
    and mid2 = List.nth sorted (len / 2) in
    (float_of_int (mid1 + mid2)) /. 2.0
  else
    float_of_int (List.nth sorted (len / 2))

let mode lst =
  let table = List.fold_left (fun acc x ->
    let count = try List.assoc x acc + 1 with Not_found -> 1 in
    (x, count)::(List.remove_assoc x acc)) [] lst in
  let max_freq = List.fold_left (fun acc (_, v) -> max acc v) 0 table in
  List.filter (fun (_, v) -> v = max_freq) table |> List.map fst

let () =
  let numbers = [4; 2; 2; 3; 5; 2; 3; 4] in
  Printf.printf "Mean: %.2f\n" (mean numbers);
  Printf.printf "Median: %.2f\n" (median numbers);
  Printf.printf "Mode(s): %s\n"
    (String.concat " " (List.map string_of_int (mode numbers)))
