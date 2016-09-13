module Services
  class DistanceCalculator

    def distance(lat1, lon1, lat2, lon2)
       p = Math::PI/180
       a = 0.5 - Math.cos((lat2 - lat1) * p)/2 +
           Math.cos(lat1 * p) * Math.cos(lat2 * p) *
               (1 - Math.cos((lon2 - lon1) * p))/2
       return 7917.5117 * Math.asin(Math.sqrt(a))
    end

    def find_locations_in_radius(home, dist)
      Location.all.map do |loc|
        if (distance(home.latitude, home.longitude, loc.latitude, loc.longitude) <= dist)
          loc
        end
      end.compact
    end

    def find_closest_jobs(locs)
      locs.map do |l|
        if l.jobs
          l.jobs
        end
      end.flatten
    end

    def find_closest_users(locs)
      locs.map do |l|
        if l.users
          l.users
        end
      end.flatten
    end

  end
end
