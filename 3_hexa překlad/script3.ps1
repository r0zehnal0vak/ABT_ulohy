$s = "506f7765727368656c6c20697320617765736f6d6521"
$bytes = [byte[]]::new(($s.Length / 2))
for ($i = 0; $i -lt $s.Length; $i += 2) {
    $bytes[$i / 2] = [byte]::Parse($s.Substring($i, 2), [System.Globalization.NumberStyles]::HexNumber)
}
$ascii = [System.Text.Encoding]::ASCII.GetString($bytes)
$ascii