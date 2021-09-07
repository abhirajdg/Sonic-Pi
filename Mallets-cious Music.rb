use_debug false
riff = (ring :b, :r, :r, :Db, :e, :r, :g, :g)
chords = (ring :B, :B, :B, :B, :E, :G)

live_loop :melody do
  use_synth :kalimba
  #play riff.tick, release: 0.3, amp: 1.5
  sleep 0.25
end

live_loop :melody2 do
  use_synth :kalimba
  #play riff.choose, release: 0.3, amp: 1.5, pan: rrand(-1,1)
  sleep 0.5
end

live_loop :keys do
  with_fx :ping_pong, phase: rrand(0.2,0.5), amp: 0.3 do
    #synth :subpulse
    play_pattern chord(chords.tick, :maj), amp: 0.1, attack: 0.2
  end
  sleep 1
end

live_loop :drums do
  #sample :bd_808, amp: 1.5
  sleep 0.25
  #sample :drum_cymbal_closed
  sleep 0.25
  #sample :drum_cymbal_closed if one_in(3)
  #sample :bd_808, amp: 1.5 if one_in(2)
  sleep 0.25
  #sample :drum_cymbal_closed if one_in(4)
  sleep 0.25
end