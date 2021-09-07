chords = (ring :e, :a, :b, :a)
rain = "C:/Users/Abhiraj/Desktop/Samples/Cymatics - LIFE - Rain - Light 9.wav"

live_loop :rain do
  sample rain
  sleep sample_duration(rain)
end

live_loop :fm do
  use_synth :fm
  with_fx :ping_pong, mix: 0.3 do
    #play choose(chord(chords.tick, :minor)), amp: 0.3, cutoff: 80, pan: rrand(-1,1)
    sleep 0.5
  end
end

use_random_seed 41
riff = (scale :e3, :minor).pick(20)
t = (knit 1,1,0.25,2,0.5,2,0.3,0.7).shuffle
live_loop :riff do
  with_fx :wobble, phase: 5 do
    with_fx :reverb, room: 0.8 do
      use_synth :pluck
      #play riff.tick, sustain: 10, amp: 0.8
      sleep t.look
    end
  end
end

live_loop :beats do
  #sample :bd_ada
  sleep 0.25
  #sample :bd_tek, amp: 0.5 if one_in (4)
  sleep 0.25
end

live_loop :hihat do
  #sample :drum_cymbal_closed, amp: 0.5
  sleep 0.125
  #sample :drum_cymbal_closed, amp: 0.3  if one_in (4)
  sleep 0.125
  #sample :drum_cymbal_closed, amp: 0.5
  sleep 0.125
  #sample :drum_cymbal_closed, amp: 0.3  if one_in (4)
  sleep 0.125
end