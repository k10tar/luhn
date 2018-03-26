defmodule Luhn do
  @moduledoc """
  Documentation for Luhn.
  """

  @doc """
  check luhn

  ## Examples

      $ elixir luhn.ex 1111222233334444
      False 

  """
  def check(argv) do
    d = 0
    flag = true
    tokn = to_string(argv)
    if String.length(tokn) == 16 do
      #      IO.puts String.reverse(tokn)
      flag = true
      l = tokn |> String.reverse |> String.codepoints
      calluhn(l,d,flag) 
    else
      IO.puts "put 16 digit code"  
    end
  end

  defp calluhn(x,d,flag)  when flag  do
    s = String.to_integer(List.first(x))
    l =  List.delete_at(x,0)
    flag = false
    if length(l) !=0 do
      calluhn(l,d+s,flag)
    end
  end

  defp calluhn(x,d,flag)  when flag != true do
    w = 2*String.to_integer(List.first(x))
    
    s = s_digit(w)  
    
    l =  List.delete_at(x,0)
    flag = true
    if length(l) != 0 do
      calluhn(l,d+s,flag)
    else
      cond do
        rem(d+s,10 ) == 0 -> IO.puts "#{d+s}: true"
        true              -> IO.puts "#{d+s}: False"
      end

    end
  end

  defp s_digit(s) when s > 9 do
    case s do
      nil -> false
      _ -> s - 9
    end
  end

  defp s_digit(s) do
    case s do
      nil -> false
      _ -> s 
    end
  end

end

Luhn.check(System.argv)
